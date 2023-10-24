from urllib.parse import quote
import requests
import bs4


# 각 문자의 UNICODE값을 분석하여 언어를 구분하는 함수들이다
def is_sp(q):
    n = ord(q)
    if n==0x20:
        return True
    else:
        return False

def is_ko(q):
    n = ord(q)
    if (0xAC00<=n and 0xD7A3>=n):
        return True
    else:
        return False

def is_en(q):
    n = ord(q)
    if ((0x41<=n and 0x5A>=n) or
        (0x61<=n and 0x7A>=n)):
        return True
    else:
        return False

def is_cc(q):
    n = ord(q)
    if ((0x3400<=n and 0x4DBF>=n) or
        (0x4E00<=n and 0x9FBF>=n) or
        (0xF900<=n and 0xFAFF>=n) or
        (0x20000<=n and 0x2A6DF>=n) or
        (0x2F800<=n and 0x2FA1F>=n)):
        return True
    else:
        return False
    
def is_ja(q):
    n = ord(q)
    if ((0x3040<=n and 0x309F>=n) or
        (0x30A0<=n and 0x30FF>=n)):
        return True
    else:
        return False


# 다음 사전 사이트에서 한자의 발음 기호를 나타내는 태그를 다른 특수구분자로 변경해두는 기능이다
# 가독성이나 추후 발음기능의 추가를 위해 만들었다
def pron(st, ls):
    if ls == 'word jp':
        # stt = st.replace("<daum:ruby>", "@jj$").replace("</daum:ruby>", "$jj@")
        stt = st.replace("<daum:ruby>", "[").replace("</daum:ruby>", "]")
    elif ls == 'word ch':
        # stt = st.replace('<daum:pinyin style="display:none">', "@cc$").replace("</daum:pinyin>", "$cc@")
        stt = st.replace('<daum:pinyin style="display:none">', "[").replace("</daum:pinyin>", "]")
    else:
        stt = st 
    return stt

# 문자열 재구성기능
def drop_a(st):
    if st[:2] == "a ":
        st = st[2:]
    elif st[:3] == "an ":
        st = st[3:]
    return st

def drop_pron(st):
    s = []
    e = []
    for i in range(len(st)):
        ri = len(st)-i-1
        if st[ri] == "[":
            s.append(ri)
        elif st[ri] == "]":
            e.append(ri)
    for sl, el in zip(s, e):
        if el == len(st):
            st = st[:sl]
        elif sl == 0:
            st = st[el+1:]
        else:
            st = st[:sl] + st[el+1:]
    return st

def drop_ineq(st):
    s = st.find("<")
    e = st.find(">")
    if s == -1 or e == -1:
        pass
    else:
        if s == 0:
            st = st[e+1:]
        else:
            st = st[:s] + st[e+1:]
    return st

# 본격적인 사전 크롤링 함수이다
def query_search(query, dict_list, search_lang):
    query = query.strip()
    if query=="":
        return {"query_present" : "검색어를 입력하세요."}
    else:
        ko_def, en_def, cc_def, ja_def = [True for i in range(4)]
        for l in query:
            if is_sp(l) or is_ko(l):
                pass
            elif is_en(l):
                ko_def, ja_def, cc_def = [False for i in range(3)]
            elif is_cc(l):
                ko_def, en_def = [False for i in range(2)]
            elif is_ja(l):
                ko_def, en_def, cc_def = [False for i in range(3)]
            else:
                ko_def, en_def, ja_def, cc_def = (False for i in range(4))
                break

        if not (ko_def or en_def or cc_def or ja_def):
            return {"query_present" : "'" + query + "'에 대한 검색어를 찾을 수 없습니다."}
        
        if ((search_lang == 'word all') or
            (ko_def and search_lang == 'word kor') or
            (en_def and search_lang == 'word eng') or
            (ja_def and search_lang == 'word jp') or
            (cc_def and (search_lang == 'word ch' or search_lang == 'word jp'))):
            pass
        else:
            return {"query_present" : "검색 언어 설정이 올바르지 않습니다."}
        
        # dict_list = ['word kor', 'word eng', 'word ch', 'word jp']
        dict_if = {'word kor':ko_def, 'word eng':en_def, 'word ch':cc_def, 'word jp':cc_def or ja_def}
        dict_name = {'word kor':'한국어','word eng':'영어', 'word ch':'중국어', 'word jp':'일본어'}
        
        # 사이트 크롤링
        query_result = {"query": query, "query_present": "검색 내용 : " + query, 'result':[]} # 결과 설정
        daum_dict_url = "https://dic.daum.net/search.do?q="
        url = daum_dict_url + quote(query)
        header = {'user-agent':'Mozilla/5'}
        response = requests.post(url, headers=header)
        html = response.text
        bs_obj = bs4.BeautifulSoup(html, 'html.parser')
        cards = bs_obj.findAll('div', {'class':'card_word'}) # 언어사전별 검색 결과및 그 외의 것들
        # tit = cards[0].find('div', {'class':'wrap_tit'}) # 첫 번째 언어사전 명
        # item = cards[0].find('ul', {'class':'list_search'}) # 첫 번째 언어사전의 첫 번째 검색 결과
        # means = item.findAll('span', {'class':'txt_search'}) # 위의 첫 검색 결과의 뜻

        for card in cards:
            try:
                card['data-tiara-layer'] # 언어사전을 나타내는 속성값 / dict_list에 있다
            except:
                pass
            else:
                if card['data-tiara-layer'] in dict_list:
                    ls = card['data-tiara-layer']
                    query_refs = card.findAll('a', {'class':'txt_cleansch'}) + card.findAll('a', {'class':'txt_searchword'})
                    means_groups = card.findAll('ul', {'class':'list_search'})
                    words_list = []
                    n = 0
                    for query_ref, means_group in zip(query_refs, means_groups):
                        n += 1
                        query_ref = query_ref.text.strip('1234567890')
                        means_group = means_group.findAll('span', {'class':'txt_search'})
                        means = []
                        means_by_string = ""
                        # 검색단어가 한국어인지 아닌지 정하기
                        query_ref_lang = "not"
                        for l in query_ref:
                            if is_ko(l):
                                query_ref_lang = "kor"
                                break
                        
                        # 검색결과 저장하기
                        for cont in means_group:
                            by_string = bs4.BeautifulSoup(pron(str(cont), ls), 'html.parser').text
                            if ls[5:] == "eng":
                                by_string = drop_a(by_string)
                            if ls[5:] == "ch" or ls[5:] == "jp":
                                by_string_p = drop_pron(by_string)
                            else:
                                by_string_p = by_string
                            means.append({'mean': by_string, 'pron': drop_ineq(by_string_p).strip()})
                            means_by_string += by_string + ", "
                        words_list.append({"query_ref": query_ref, "query_ref_lang": query_ref_lang, "means_by_string": means_by_string[:-2], "means": means})
                        if n == 10:
                            break
                    query_result['result'].append({'lang': dict_name[ls], 'lang_e': ls[5:], 'words': words_list})
        return query_result
        