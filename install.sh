banner() {
	#printf "\033[1;93m"
	toilet -f font -F metal Random
	#toilet -f standard -f mono12 Zsh
	toilet -f font -F metal Theme
	}
	R-T() {
		cd ~
		if [ -e zshrc4 ];then
		rm -rf .zshrc zsh* Theme
		else
		sleep 3
		printf "\n\n\033[1;92m First install then uninstall\n\n"
		fi
		}
	pa() {
		cd ~
		if [ -e zshrc4 ];then
		random
		chsh -s zsh
		sleep 4
		printf "\n\n Successfully installed random theme\n\n"
		random
		printf "\n\n Restart Termux\n\n"
		else
		sleep 2
		printf "\n\n\033[1;91m Not installed random theme !!! Try again!!\n\n"
		fi
		}
		cff() {
			cd ~
			if [ -e Theme ];then
			echo
			else
			mkdir Theme
			fi
			}
	theme() {
		cd ~
		if [ -e .zshrc ];then
		sleep 4
		printf "\n\n\033[91m Sorry  You cannot use random theme because you already install zsh theme!!!\n\n"
		exit
		else
		cd ~/Random-Theme/files
		sleep 1
		dpkg -i Random-Theme.deb
		dpkg -i Random.deb
		dpkg -i Font.deb
		cff
		
		printf "\n\033[1;96m Now setuping auto suggession and highlighting\n"
		cd ~/Theme > /dev/null 2>&1
		printf "\n\033[1;93m Cloning Auto Suggession\n\n"
		git clone https://github.com/zsh-users/zsh-autosuggestions
		printf "\n\033[1;93m Cloning Highlighting\n\n"
		git clone https://github.com/zsh-users/zsh-syntax-highlighting
		printf "\nCloning ohmyzsh\n\n"
		cd ~
		git clone https://github.com/ohmyzsh/ohmyzsh
		mv ohmyzsh .oh-my-zsh
		cd ~
		printf "\nCloning Powerlevel10k\n\n"
		git clone https://github.com/romkatv/powerlevel10k
		pa
		fi
		}
	menu() {
		#echo -e "\033[1;93m
		cd ~/Random-Theme
		cat b|toilet -F metal -f term
		printf "\033[0m\n\033[91m[\033[0m1\033[91m]\033[1;92m Install Random Zsh-Theme\n"
		printf "\033[91m[\033[0m2\033[91m]\033[1;92m Uninstall Random Zsh-Theme\n"
		printf "\033[91m[\033[0m3\033[91m]\033[1;92m Exit\n\n\n"
		echo -e -n "\033[93mRandom\033[0m@\033[1;92mTheme\033[1;96m-->>\033[0m "
		read b
		case $b in
		1)theme ;;
		2)R-T ;;
		3)exit ;;
		*)menu ;;
		esac
		}
		setup() {
			printf "\n \033[92m[+]\033[1;93m Installing requirements… \n\n"
			sleep 2
			printf "\033[93m[+]\033[1;94m Updating package..\n"
			apt update
			apt upgrade
			sleep 1
			printf "\033[94m[+]\033[1;95m Installing python\n"
			apt install python
			sleep 1
			printf "\033[95m[+]\033[1;96m Installing zsh\n"
			apt install zsh
			printf "\033[91m[+]\033[1;92m Installing toilet\n"
			
			apt install toilet
			sleep 1
			printf "\033[93m[+]\033[1;94m Installing figlet\n"
			
			apt install figlet
			sleep 1
			printf "\033[94m[+]\033[1;95m Checking problem\n"
			
			apt install --fix-broken
			cd $PREFIX
			echo "Setup complete" >> setup
			cd ~/Random-Theme
			rm -f changelog.sh
			clear
			menu
			}
			chg() {
				if [ -e ~/Random-Theme ];then
				echo
				else
				clear
				printf "\n\033[1;92m This Tool Is Not For Any Child\n\n"
				exit
				fi
				}
			menu2() {
				printf "\n\n\n\033[91m[\033[0m1\033[91m]\033[1;92m Install Requirements\n\n\n"
				printf "\033[1;93m Press 1 and Enter\n\n"
				read a
				case $a in
				1)setup ;;
				*)printf "\n\n\033[1;91m Kya type kr rhe ho!!\n\n" ;;
				esac
				}
			se() {
				cd $PREFIX
				if [ -e setup ];then
				menu
				else
				menu2
				fi
				}
				changelog() {
					clear
					cd ~
					chg
					cd ~/Random-Theme
					rm changelog.sh
					clear
					wget -q https://raw.githubusercontent.com/rooted-cyber/Random-Theme/main/changelog.sh
					bash changelog.sh
					rm -f changelog.sh
					echo -e -n "\n\n\033[1;92m Install it?\033[91m (\033[0my|n\033[1;91m) "
					read bb
					if [ "$bb" == "y" ] || [ "$bb" == "Y" ] || [ "$bb" == "*" ];then
					se
					fi
					}
					changelog
		