# google 번역 모바일 페이지 크롤링

from distutils import text_file
from typing import Literal
import requests
from bs4 import BeautifulSoup

def google_translate(
        text: str,
        source: Literal["auto","en","ko"], # 받을 type
        target: Literal["en","ko","ja","zh"], # 번역할 type
) -> str:
    text = text.strip()
    # 빈문자열일때
    if not text:
        return ""
    
    endpoint_url = "https://translate.google.com/m"

    # google 번역 모바일 페이지 요청내역 파라미터
    params = {
        "sl" : source,
        "tl" : target,
        "q" : text,
        "ie" : "UTF-8",
        "prev" : "_m",
    }

    # Android User-Agent
    headers = {
        "User-Agent": (
            "Mozilla/5.0 (Linux; Android 13; SM-S908B) AppleWebKit/537.36"
            "(KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36"
        ),
    }
    # 요청
    res = requests.get(
        endpoint_url,
        params=params,
        headers=headers,
        timeout=5,
    )

    res.raise_for_status() # 200 OK 코드가 아닌 경우 에러 발동

    soup = BeautifulSoup(res.text, "html.parser")
    translated_text = soup.select_one(".result-container").text.strip()  # 번역 결과 추출

    return translated_text