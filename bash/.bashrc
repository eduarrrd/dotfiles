# Test for an interactive shell
if [[ $- != *i* ]]
then
	return
fi

for i in ~/.bash.d/*
do
  if [ -r "$i" ]
  then
    . $i
  fi
done

PATH=~/dotfiles/bin:$PATH
