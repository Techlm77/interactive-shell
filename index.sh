#!/bin/bash
printf '\e[8;30;100t'

# Colors ###################################
ESC=$(printf '\033') 
RESET="${ESC}[0m"           # Reset
DEFAULT="${ESC}[39m"        # Default

# Regular Colors
Black="${ESC}[0;30m"        # Black
Red="${ESC}[0;31m"          # Red
Green="${ESC}[0;32m"        # Green
Yellow="${ESC}[0;33m"       # Yellow
Blue="${ESC}[0;34m"         # Blue
Purple="${ESC}[0;35m"       # Purple
Cyan="${ESC}[0;36m"         # Cyan
White="${ESC}[0;37m"        # White

blackprint() { printf "${Black}%s${RESET}\n" "$1"; }
redprint() { printf "${Red}%s${RESET}\n" "$1"; }
greenprint() { printf "${Green}%s${RESET}\n" "$1"; }
yellowprint() { printf "${Yellow}%s${RESET}\n" "$1"; }
blueprint() { printf "${Blue}%s${RESET}\n" "$1"; }
purpleprint() { printf "${Purple}%s${RESET}\n" "$1"; }
cyanprint() { printf "${Cyan}%s${RESET}\n" "$1"; }
whiteprint() { printf "${White}%s${RESET}\n" "$1"; }


# Functions ################################
fn_vm_win10__full_gpu() { 
    echo; virsh start Windows-10-GPU-Passthrough-Full && clear; exit 0; 
}

fn_vm_win10__half_gpu() { 
    echo; virsh start Windows-10-GPU-Passthrough-Half && clear; exit 0; 
}

fn_vscode() { 
    code; 
}

fn_codium() {
    codium;
}

fn_exit() { 
    clear; exit 0; 
}

fn_fail() { 
    echo "Wrong option." exit 1; 
}

############################################
mainmenu() {
    clear && echo -ne "
$(greenprint '
                          ███████╗███████╗██╗     ███████╗ ██████╗████████╗           
                          ██╔════╝██╔════╝██║     ██╔════╝██╔════╝╚══██╔══╝           
                          ███████╗█████╗  ██║     █████╗  ██║        ██║              
                          ╚════██║██╔══╝  ██║     ██╔══╝  ██║        ██║              
                          ███████║███████╗███████╗███████╗╚██████╗   ██║              
                          ╚══════╝╚══════╝╚══════╝╚══════╝ ╚═════╝   ╚═╝              

                 ██████╗ █████╗ ████████╗███████╗ ██████╗  ██████╗ ██████╗ ██╗   ██╗
                ██╔════╝██╔══██╗╚══██╔══╝██╔════╝██╔════╝ ██╔═══██╗██╔══██╗╚██╗ ██╔╝
                ██║     ███████║   ██║   █████╗  ██║  ███╗██║   ██║██████╔╝ ╚████╔╝ 
                ██║     ██╔══██║   ██║   ██╔══╝  ██║   ██║██║   ██║██╔══██╗  ╚██╔╝  
                ╚██████╗██║  ██║   ██║   ███████╗╚██████╔╝╚██████╔╝██║  ██║   ██║   
                 ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
')
                                      $(purpleprint '1)') QEMU/KVM 💽
                                      $(yellowprint '2)') Programming 👨‍💻
                                      $(redprint '0)') Exit
                                      Choose an option: "
    read -r ans
    case $ans in
    1)
        qemu/kvm
        mainmenu
        ;;
    2)
        programming
        mainmenu
        ;;
    0)
        fn_exit
        ;;
    *)
        fn_fail
        ;;
    esac
}

qemu/kvm() {
    clear && echo -ne "
$(greenprint '
                          ███████╗███████╗██╗     ███████╗ ██████╗████████╗               
                          ██╔════╝██╔════╝██║     ██╔════╝██╔════╝╚══██╔══╝               
                          ███████╗█████╗  ██║     █████╗  ██║        ██║                  
                          ╚════██║██╔══╝  ██║     ██╔══╝  ██║        ██║                  
                          ███████║███████╗███████╗███████╗╚██████╗   ██║                  
                          ╚══════╝╚══════╝╚══════╝╚══════╝ ╚═════╝   ╚═╝                  

                 ██████╗ ███████╗███╗   ███╗██╗   ██╗    ██╗██╗  ██╗██╗   ██╗███╗   ███╗
                ██╔═══██╗██╔════╝████╗ ████║██║   ██║   ██╔╝██║ ██╔╝██║   ██║████╗ ████║
                ██║   ██║█████╗  ██╔████╔██║██║   ██║  ██╔╝ █████╔╝ ██║   ██║██╔████╔██║
                ██║▄▄ ██║██╔══╝  ██║╚██╔╝██║██║   ██║ ██╔╝  ██╔═██╗ ╚██╗ ██╔╝██║╚██╔╝██║
                ╚██████╔╝███████╗██║ ╚═╝ ██║╚██████╔╝██╔╝   ██║  ██╗ ╚████╔╝ ██║ ╚═╝ ██║
                 ╚══▀▀═╝ ╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝    ╚═╝  ╚═╝  ╚═══╝  ╚═╝     ╚═╝
')
                            $(purpleprint '1)') Windows 10 Full Performance (GPU Passthrough)
                            $(greenprint '2)') Windows 10 Half Performance (GPU Passthrough)
                            $(blueprint '3)') Back
                            $(redprint '0)') Exit
                            Choose an option: "
    read -r ans
    case $ans in
    1)
        fn_vm_win10__full_gpu
        qemu/kvm
        ;;
    2)
        fn_vm_win10_half_gpu
        qemu/kvm
        ;;
    3)
        mainmenu
        ;;
    0)
        fn_exit
        ;;
    *)
        fn_fail
        ;;
    esac
}

programming() {
    clear && echo -ne "
$(greenprint '
                          ███████╗███████╗██╗     ███████╗ ██████╗████████╗               
                          ██╔════╝██╔════╝██║     ██╔════╝██╔════╝╚══██╔══╝               
                          ███████╗█████╗  ██║     █████╗  ██║        ██║                  
                          ╚════██║██╔══╝  ██║     ██╔══╝  ██║        ██║                  
                          ███████║███████╗███████╗███████╗╚██████╗   ██║                  
                          ╚══════╝╚══════╝╚══════╝╚══════╝ ╚═════╝   ╚═╝                  
                                                                                                
  ██████╗ ███████╗██╗   ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗███╗   ██╗████████╗
  ██╔══██╗██╔════╝██║   ██║██╔════╝██║     ██╔═══██╗██╔══██╗████╗ ████║██╔════╝████╗  ██║╚══██╔══╝
  ██║  ██║█████╗  ██║   ██║█████╗  ██║     ██║   ██║██████╔╝██╔████╔██║█████╗  ██╔██╗ ██║   ██║   
  ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║   ██║██╔═══╝ ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   
  ██████╔╝███████╗ ╚████╔╝ ███████╗███████╗╚██████╔╝██║     ██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   
  ╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   
')
                                      $(purpleprint '1)') Visual Studio Code
                                      $(greenprint '2)') Codium (Unavailable)
                                      $(yellowprint '3)') Back
                                      $(blueprint '0)') Exit
                                      Choose an option: "
    read -r ans
    case $ans in
    1)
        fn_vscode
        programming
        ;;
    2)
        fn_codium
        programming
        ;;
    3)
        mainmenu
        ;;
    0)
        fn_exit
        ;;
    *)
        fn_fail
        ;;
    esac
}

mainmenu
