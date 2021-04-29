#@title **Create User**
#@markdown Enter Username and Password

username = "ALOK" #@param {type:"string"}
password = "1234" #@param {type:"string"}

print("Creating User and Setting it up")

# Creation of user
! sudo useradd -m $username &> /dev/null

# Add user to sudo group
! sudo adduser $username sudo &> /dev/null
    
# Set password of user to 'root'
! echo '$username:$password' | sudo chpasswd

# Change default shell from sh to bash
! sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd

print("User Created and Configured")
