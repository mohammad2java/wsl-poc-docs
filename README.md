

# wsl-poc-docs
   ## why WSL 
   -------------
     to run/install linux distribution inside windows os [example ubuntu or debian]

## what is WSL 
   -------------
     It is software from windows and as subsystem for linux os -- You check current version installed by
     wsl --version // for check current version
     wsl --update  //for update wsl version
     https://github.com/microsoft/wsl/releases

## how to do WSL
     ---------------------
           wsl --help // you will get list of command ..
     

            Install debian and docker service inside debian using wsl in windows - 
            ---------------------------------------------------------------------
            
            listing availble distro in machine
            -----------------------------------
            C:\Users\HP>wsl --list
            	Windows Subsystem for Linux Distributions:
            	rancher-desktop-data (Default)
            	Debian
            	rancher-desktop
            	docker-desktop
            
            
            
            listing availble distro from online
            -----------------------------------
            C:\Users\HP>wsl --list --online
            The following is a list of valid distributions that can be installed.
            Install using 'wsl.exe --install <Distro>'.
            
            NAME                            FRIENDLY NAME
            AlmaLinux-8                     AlmaLinux OS 8
            AlmaLinux-9                     AlmaLinux OS 9
            AlmaLinux-Kitten-10             AlmaLinux OS Kitten 10
            AlmaLinux-10                    AlmaLinux OS 10
            Debian                          Debian GNU/Linux
            FedoraLinux-43                  Fedora Linux 43
            FedoraLinux-42                  Fedora Linux 42
            SUSE-Linux-Enterprise-15-SP7    SUSE Linux Enterprise 15 SP7
            SUSE-Linux-Enterprise-16.0      SUSE Linux Enterprise 16.0
            Ubuntu                          Ubuntu
            Ubuntu-24.04                    Ubuntu 24.04 LTS
            archlinux                       Arch Linux
            eLxr-12                         eLxr 12.12.0.0 GNU/Linux
            kali-linux                      Kali Linux Rolling
            openSUSE-Tumbleweed             openSUSE Tumbleweed
            openSUSE-Leap-16.0              openSUSE Leap 16.0
            Ubuntu-20.04                    Ubuntu 20.04 LTS
            Ubuntu-22.04                    Ubuntu 22.04 LTS
            OracleLinux_7_9                 Oracle Linux 7.9
            OracleLinux_8_10                Oracle Linux 8.10
            OracleLinux_9_5                 Oracle Linux 9.5
            openSUSE-Leap-15.6              openSUSE Leap 15.6
            SUSE-Linux-Enterprise-15-SP6    SUSE Linux Enterprise 15 SP6
            
            
            install desire distro example debian
            
            -----------------------
            wsl --install -d <nameofdistro>
            wsl --install -d debian
            
            
            ---------------
            how to enter debian linux
            ---------------------------
            C:\Users\HP>wsl -d debian
            mohd@mohd:/mnt/c/Users/HP$
            
            
            how to shutdown/terminal running distro
            -----------------------------------------
            wsl --terminate debian
            
            how to uninstall/remove/delete/ installed distro
            -------------------------------------------------
            wsl --unregister debian
            
            
          set default destro[direct logged in via wsl command no need to tell distro like wsl -d debian]
          -------------------------
          wsl -s debian
          
  
            after enter into debian linux
            ==============================
            
            sudo apt update -y
            
            sudo apt install -y ca-certificates curl gnupg lsb-release
            		
            	
            sudo mkdir -p /etc/apt/keyrings
            curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
            
            
            echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
              
              
              
            sudo apt update
            sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
            
            
            sudo service docker start
            
            sudo docker run -p80:80 nginx
  
            verify:  curl http://localhost

