# -*- coding: utf-8 -*-


from moviepy.editor import *
from pytube import Playlist, YouTube
import sys
import googletrans



def AI_translate_eng_to_kor(something_that_i_want_to_translate):
    translater = googletrans.Translator()
    text_translated=translater.translate(something_that_i_want_to_translate, dest='ko', src='en')  # possible option:src='auto'
    # print(text_translated.text)
    return str(text_translated.text)


print(sys.argv[1])

