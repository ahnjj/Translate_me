from urllib.request import urlopen
import bs4

def not_found(q):
    print("'"+q+"'에 해당하는 결과를 찾을 수 없습니다")

def is_space(q):
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
    query_result = {"query" : "검색 내용 : " + query, "result" : []}
    if query=="":
        return {"query" : "검색어를 입력하세요."}
    else:
        ko_def, en_def, ja_def, cn_def = [True for i in range(4)]
        for l in query:
            if is_space(l):
                pass
            elif is_ko(l):
                en_def, ja_def, cn_def = [False for i in range(3)]
            elif is_en(l):
                ko_def, ja_def, cn_def = [False for i in range(3)]
            elif is_ja(l):
                ko_def, en_def, cn_def = [False for i in range(3)]
            elif is_cc(l):
                ko_def, en_def = [False for i in range(2)]
            else:
                ko_def, en_def, cn_def, ja_def = [False for i in range(4)]
                break
        validity = ko_def or en_def or ja_def or cn_def
        if validity:
            if ko_def:
                query_result["ko"] = {"mean" : "한국어 뜻"}
                query_result["result"].append({"lang" : "영어", "word" : "영어 단어", "mean" : "영어 뜻"})
                query_result["result"].append({"lang" : "일본어", "word" : "일본어 단어", "mean" : "일본어 뜻"})
                query_result["result"].append({"lang" : "중국어", "word" : "중국어 단어", "mean" : "중국어 뜻"})
            if en_def:
                query_result["ko"] = {"word" : "한국어 단어", "mean" : "한국어 뜻"}
                query_result["result"].append({"lang" : "영어", "word" : "영어 단어", "mean" : "영어 뜻"})
            if ja_def:
                query_result["ko"] = {"word" : "한국어 단어", "mean" : "한국어 뜻"}
                query_result["result"].append({"lang" : "일본어", "word" : "일본어 단어", "mean" : "일본어 뜻"})
            if cn_def:
                query_result["ko"] = {"word" : "한국어 단어", "mean" : "한국어 뜻"}
                query_result["result"].append({"lang" : "중국어", "word" : "중국어 단어", "mean" : "중국어 뜻"})
            return query_result
        else:
            return {"query" : query + "에 대한 검색 결과가 존재하지 않습니다."}