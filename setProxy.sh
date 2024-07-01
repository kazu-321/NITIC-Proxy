PROXY=po.cc.ibaraki-ct.ac.jp:3128
HTTP_PROXY=http://${PROXY}
HTTPS_PROXY=http://${PROXY}

echo "set proxy of kosen? (y/n)"
read proxy

if [ "${proxy}" = "y" ];then
  # apt
  export http_proxy=${HTTP_PROXY}
  export https_proxy=${HTTPS_PROXY}
  
  # git
  git config --global http.proxy ${HTTP_PROXY}
  git config --global https.proxy ${HTTPS_PROXY}
  
  # npm
  # npm -g config set proxy ${HTTP_PROXY}
  # npm -g config set https-proxy ${HTTP_PROXY}
  # npm -g config set registry "http://registry.npmjs.org/"
  
  # yarn
  # yarn config set proxy ${HTTP_PROXY} -g > /dev/null 2>&1
  # yarn config set https-proxy ${HTTP_PROXY} -g > /dev/null 2>&1
  alias sudo="sudo -E "
else
  unset http_proxy
  unset https_proxy
  git config --global --unset http.proxy
  git config --global --unset https.proxy
  # npm -g config delete proxy
  # npm -g config delete https-proxy
  # npm -g config delete registry
  # yarn config delete proxy -g > /dev/null 2>&1
  # yarn config delete https-proxy -g > /dev/null 2>&1
fi
