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
        stt = st.replace("<daum:ruby>", "@jj$").replace("</daum:ruby>", "$jj@")
    elif ls == 'word ch':
        stt = st.replace('<daum:pinyin style="display:none">', "@cc$").replace("</daum:pinyin>", "$cc@")
    else:
        stt = st 
    return stt


# 본격적인 사전 크롤링 함수이다
def query_search(query, dict_list):
    query = query.strip()
    if query=="":
        return {"query" : "검색어를 입력하세요."}
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
            return {"query" : "'" + query + "'에 대한 검색어를 찾을 수 없습니다."}
        
        # dict_list = ['word kor', 'word eng', 'word ch', 'word jp']
        dict_if = {'word kor':ko_def, 'word eng':en_def, 'word ch':cc_def, 'word jp':cc_def or ja_def}
        dict_name = {'word kor':'한국어','word eng':'영어', 'word ch':'중국어', 'word jp':'일본어'}
        
        # 사이트 크롤링
        query_result = {'query': "검색 내용 : " + query, 'result':[]} # 결과 설정
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
                    means = card.find('ul', {'class':'list_search'}).findAll('span', {'class':'txt_search'})

                if card['data-tiara-layer'] == 'word kor' and ('word kor' in dict_list): # 한글의 경우 검색란 최상단에 따로 표시하기 위해 구분한다
                    if len(means) == 1:
                        mean = [means[0].text]
                    else:
                        mean = []
                        for cont in means:
                            mean.append(cont.text)
                    query_result['ko'] = mean
                else:
                    for ls in dict_list:
                        if dict_if[ls] and card['data-tiara-layer'] == ls and ls != 'word kor': # 다른 언어는 한국어 검색결과 밑으로 리스트 형식으로 나온다
                            # string형식에서 발음기호 태그를 변경하기 때문에 변경 후에는 다시 html파싱을 통해 나머지 태그들을 제거해준다
                            if len(means) == 1:
                                string = pron(str(means[0]), ls)
                                string = bs4.BeautifulSoup(string, 'html.parser').text
                            else:
                                string = ""
                                for s in means:
                                    string += pron(str(s), ls) + ", "
                                string = bs4.BeautifulSoup(string[:-2], 'html.parser').text
                            query_result['result'].append({'lang':dict_name[ls], 'word':string, 'lang_e':ls})
        return query_result
        