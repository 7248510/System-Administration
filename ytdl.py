import subprocess
def linux():
    #Script has been tested on Centos.
    #This script requires you to add youtube-dl to your path(Windows or Linux) or run the script with the youtube-dl executable(Windows).
    base = 'youtube-dl'
    yt_url = input("Please input the playlist URL you would like to download.\n")
    flag1 = '--yes-playlist'
    flag2 = '--no-check-certificate'
    flag3 = '--write-sub'
    flag4 = '--playlist-start 1'
    space = " "
    output_set = "youtube-archive/"
    output_name = input("Please input the folder name you would like to save your files too.\n")
    output_end = "/%(title)s.%(ext)s"
    print("Your download has started. This is intended for playlists.")
    command = base + space + yt_url + space + flag1 + space + space +flag2 + space + flag3+ space + flag4 +space + "-o " + output_set + output_name + output_end
    subprocess.call(command, shell=False)
def windows():
    base = 'youtube-dl.exe'
    yt_url = input("Please input the playlist URL you would like to download.\n")
    flag1 = '--yes-playlist'
    flag2 = '--no-check-certificate'
    flag3 = '--write-sub'
    flag4 = '--playlist-start 1'
    space = " "
    output_set = "C:\\Users\\%username%\\Desktop\\"
    output_name = input("Please input the folder name you would like to save your files to.\n")
    output_end = "\\%(title)s.%(ext)s"
    print("Your download has started. This is intended for playlists.")
    command = base + space + yt_url + space + flag1 + space + space +flag2 + space + flag3+ space + flag4 +space + "-o " + output_set + output_name + output_end
    subprocess.call(command, shell=False)
def choice():
    print("If you're on Windows enter 1, if your on Linux enter 2.")
    choiceE = eval(input())
    if (choiceE == 1):
        windows()
    if (choiceE == 2):
        linux()
choice()
