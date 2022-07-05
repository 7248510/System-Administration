echo "Fulfilling dependencies for Machine Learning on Ubuntu"


dlibInstall()
{
  echo "Installing dlib dependencies"
  sudo apt-get install build-essential cmake -y
  sudo apt-get install python3-pip -y
  sudo apt-get install libgtk-3-dev -y
  sudo apt-get install libboost-all-dev -y
}

vscInstall()
{
  sudo snap install --classic code
}


pipHome() {
  #Change the username 
  #/home/caleb/.local/bin #PATH
  export PATH="$PATH:/home/caleb/.local/bin"
  source ~/.profile 
  source ~/.bashrc
}

pipInstall()
{
  pip3 install numpy
  pip3 install opencv-python
  pip3 install -U scikit-learn
  pip3 install tensorflow
  pip3 install cmake
  pip3 install dlib
  pip3 install imutils
  pip3 install face_recognition
}

vscInstall
dlibInstall
pipInstall
