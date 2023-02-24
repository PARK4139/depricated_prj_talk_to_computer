import traceback
from datetime import time

from moviepy.editor import *
import sys
from pytube import YouTube, Playlist 
# ____________________________________________________________________________________ 채널리스트로 다운로드[대기]


# playlist =Playlist('https://www.youtube.com/watch?v=DN-Ur5reNpU&list=UU3zABYmTxp_MyEEvFmekrFQ&ab_channel=%EB%8B%8C%EC%A3%BC')
# playlist =Playlist(videoesURL)
# print('Number of videos in playlist: %s' % len(playlist.video_urls))


# for video in playlist.videos:
# try:
# print(video.streams.filter(file_extension='mp4'))
# stream = video.streams.get_by_itag(137) # 137 = 1080P30
# stream.download()
# except AttributeError:
# stream = video.streams.get_by_itag(22) # 22, 136 = 720P30; if 22 still don't work, try 136
# stream.download()
# except:
# print("Something went wrong.")


# ____________________________________________________________________________________ 영상URL로 고화질 다운로드[in trying]
#
# fpath = lambda x: './from_youtube/' + x
# DOWNLOAD_FOLDER = "[TO DO]"
#
#
# videoURLs = [
#     'https://youtu.be/hpbHMiLZzY8?list=PLa9dKeCAyr7iWPMclcDxbnlTjQ2vjdIDD'
# ]
#
# os.chdir('..')  # 부모
# if os.path.exists(DOWNLOAD_FOLDER):
#     os.chdir(DOWNLOAD_FOLDER)
# else:
#     os.mkdir(DOWNLOAD_FOLDER)
#     os.chdir(DOWNLOAD_FOLDER)
#
#
# def ydown(url: str, prefix: str = "프리픽스"):
#     yt = YouTube(url)
#     vpath = (
#     yt.streams.filter(adaptive=True, file_extension="mp4", only_video=True)
#     .order_by("resolution")
#     .desc()
#     .first()
#     .download(output_path=fpath("video/"), filename_prefix=f"{prefix} ")
#     )
#     apath = (
#     yt.streams.filter(adaptive=True, file_extension="mp4", only_audio=True)
#     .order_by("abr")
#     .desc()
#     .first()
#     .download(output_path=fpath("audio/"), filename_prefix=f"{prefix} ")
#     )
#     v = VideoFileClip(vpath)
#     a = AudioFileClip(apath)
#
#
# def playlistdown(url: str, prefix: str = ""):
#     pl = Playlist(url)
#     for v in pl.video_urls:
#         try:
#             ydown(v, prefix)
#         except:
#            continue
#
#
# for i in range(0,len(videoURLs)):
#     ydown(videoURLs[i])


# ____________________________________________________________________________________ 영상URL로 고화질 다운로드[in trying]
# fpath = lambda x: './from_youtube/' + x
# destination = "../[TO DO]"


# videoURLs=[
# '___________________',
# 'https://youtu.be/hpbHMiLZzY8?list=PLa9dKeCAyr7iWPMclcDxbnlTjQ2vjdIDD'
# '___________________',
# '___________________',
# '___________________',
# '___________________',
# '___________________',
# '___________________'
# ]


# if os.path != destination:
# os.mkdir(destination)

# os.chdir(destination)


# def ydown(url: str, prefix: str = "프리픽스"):
# yt = YouTube(url)
# vpath = (
# yt.streams.filter(adaptive=True, file_extension="mp4", only_video=True)
# .order_by("resolution")
# .desc()
# .first()
# .download(output_path=fpath("video/"), filename_prefix=f"{prefix} ")
# )
# apath = (
# yt.streams.filter(adaptive=True, file_extension="mp4", only_audio=True)
# .order_by("abr")
# .desc()
# .first()
# .download(output_path=fpath("audio/"), filename_prefix=f"{prefix} ")
# )
# v = VideoFileClip(vpath)
# a = AudioFileClip(apath)


# video 와 audio 를 합한다.
# v.audio = a
# v.write_videofile(fpath(f"1080/{vpath.split('/')[-1]}"))
# from_youtube_src 를 삭제한다.


# def playlistdown(url: str, prefix: str = ""):
# pl = Playlist(url)
# for v in pl.video_urls:
# try:
# ydown(v, prefix)
# except:
# continue


# for i in range(0,len(videoURLs)):
# ydown(videoURLs[i])


# ____________________________________________________________________________________ 영상URL로 고화질 다운로드[ feat sys.argv ]
directory_name = 'seperated_contents'
fpath = lambda x: './'+directory_name+'/' + x
DOWNLOAD_FOLDER = "from_youtube"

os.chdir('..')  
os.chdir('..')  
os.chdir('`')
if os.path.exists(DOWNLOAD_FOLDER):
    pass
else:
    os.mkdir(DOWNLOAD_FOLDER)
os.chdir(DOWNLOAD_FOLDER)
if os.path.exists(directory_name):
    pass
else:
    os.mkdir(directory_name)
os.chdir(directory_name)
# print(os.getcwd())
# os.chdir('..')  




def ydown(url: str, prefix: str = "순수비디오_"):
    yt = YouTube(url)
    vpath = (
        yt.streams.filter(adaptive=True, file_extension="mp4", only_video=True)
        .order_by("resolution")
        .desc()
        .first()
        .download(output_path=fpath("video/"), filename_prefix=f"{prefix} ")
    )
    apath = (
        # yt.streams.filter(adaptive=True, file_extension="mp3", only_audio=True)
        # yt.streams.filter(adaptive=True, file_extension="flac", only_audio=True)
        yt.streams.filter(adaptive=True, file_extension="mp4", only_audio=True)
        .order_by("abr")
        .desc()
        .first()
        .download(output_path=fpath("audio/"), filename_prefix="순수음성_")
    )
    afc = AudioFileClip(apath)
    vfc = VideoFileClip(vpath)


    # vfc.audio = afc
    
    # print(yt.streams.all())
    # print("2"+str(yt.title)+'[DONE]')
    # vfc.write_videofile(yt.title[0:10]+str(time)+'.mp4')
   
   
    # vfc.write_videofile('from_youtube.mp4')
    # os.renames('from_youtube.mp4',str(yt.title)+'.mp4')

def playlistdown(url: str, prefix: str = "플레이리스트 다운로드 시도"):
    pl = Playlist(url)
    for v in pl.video_urls:
        try:
            ydown(v, prefix)
        except:
            print('occurs exception in playlistdown')
            continue

# print(str(sys.argv[1]))
try:
    for i in range(1, len(sys.argv)):
        print(str(sys.argv[i]))
        ydown(str(sys.argv[i]) +'[TRIED_TO_DOWNLOAD]')
except Exception as e:
    print('______________________________________________________  error id 2023 02 18 16 28 s')
    print('______________________________________________________  e info s')
    print(e)
    print('______________________________________________________  e info e')
    print('______________________________________________________  trouble shooting info s')
    traceback.print_exc(file=sys.stdout)
    print('______________________________________________________  trouble shooting info e')
    print('______________________________________________________  error id 2023 02 18 16 28 e')