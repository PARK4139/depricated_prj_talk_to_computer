from moviepy.editor import *
from pytube import Playlist, YouTube
import sys
import googletrans



def AI_translate_eng_kor(something_that_i_want_to_translate):
    translater = googletrans.Translator()
    text_translated=translater.translate(something_that_i_want_to_translate, dest='ko', src='en')  # possible option:src='auto'
    print(AI_translate_eng(something_that_i_want_to_translate))
    return text_translated


print(AI_translate_eng(sys.argv[1]))



