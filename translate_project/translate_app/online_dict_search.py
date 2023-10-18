from urllib.parse import quote
import requests
import bs4

def not_found(q):
    print("'"+q+"'에 해당하는 결과를 찾을 수 없습니다")

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

def query_search(query):
    query = query.strip()
    if query=="":
        return {"query" : "검색어를 입력하세요."}
    else:
        ko_def, en_def, cc_def, jp_def = [True for i in range(4)]
        for l in query:
            if is_sp(l):
                pass
            elif is_ko(l):
                en_def, ja_def, cc_def = (False for i in range(3))
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
        
        dict_list = ['word kor', 'word eng', 'word ch', 'word jp']
        dict_if = {'word eng':en_def, 'word ch':cc_def, 'word jp':cc_def or ja_def}
        dict_name = {'word kor':'한국어','word eng':'영어', 'word ch':'중국어', 'word jp':'일본어'}
        
        # 사이트 크롤링
        query_result = {'query': "검색 내용 : " + query, 'result':[]} # 결과 설정
        daum_dict_url = "https://dic.daum.net/search.do?q="
        url = daum_dict_url + quote(query)
        header = {'user-agent':'Mozilla/5'}
        response = requests.post(url, headers=header)
        html = response.text
        bs_obj = bs4.BeautifulSoup(html, 'html.parser')
        cards = bs_obj.findAll('div', {'class':'card_word'}) # 언어사전별 검색 결과
        # tit = cards[0].find('div', {'class':'wrap_tit'}) # 첫 번째 언어사전 명
        # item = cards[0].find('ul', {'class':'list_search'}) # 첫 번째 언어사전의 첫 번째 검색 결과
        # means = item.findAll('span', {'class':'txt_search'}) # 위의 첫 검색 결과의 뜻

        if ko_def:
            for card in cards:
                try:
                    card['data-tiara-layer']
                except:
                    pass
                else:
                    if card['data-tiara-layer'] in dict_list:
                        means = card.find('ul', {'class':'list_search'}).findAll('span', {'class':'txt_search'})
                        if len(means) == 1:
                            mean = [means[0].text]
                        else:
                            mean = []
                            for string in means:
                                mean.append(string.text)
                    
                    if card['data-tiara-layer'] == 'word kor':
                        query_result['ko'] = mean
                    elif card['data-tiara-layer'] == 'word eng':
                        query_result['result'].append({'lang':'영어', 'word':mean})
                    elif card['data-tiara-layer'] == 'word ch':
                        query_result['result'].append({'lang':'중국어', 'word':mean})
                    elif card['data-tiara-layer'] == 'word jp':
                        query_result['result'].append({'lang':'일본어', 'word':mean})
        else:
            for card in cards:
                try:
                    card['data-tiara-layer']
                except:
                    pass
                else:
                    if card['data-tiara-layer'] in dict_list:
                        means = card.find('ul', {'class':'list_search'}).findAll('span', {'class':'txt_search'})
                        if len(means) == 1:
                            mean = [means[0].text]
                        else:
                            mean = []
                            for string in means:
                                mean.append(string.text)
                        # if len(means) == 1:
                        #     mean = means[0].text
                        # else:
                        #     mean = ""
                        #     for string in means:
                        #         mean += string.text + ", "
                        #     mean = mean[:-2]
                    if card['data-tiara-layer'] == 'word kor':
                        query_result['ko'] = mean
                    else:
                        for ls in dict_list[1:]:
                            if dict_if[ls] and card['data-tiara-layer'] == ls:
                                query_result['result'].append({'lang':dict_name[ls], 'word':mean})

        return query_result
        