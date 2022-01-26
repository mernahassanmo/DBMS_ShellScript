#! /bin/bash
PS3=" =>: "	
echo "Welcome to our SHALL SCRIPT DATABASE MANAGEMENT SYSTEM PROJECT (DBMS)";echo -e  "\U001F495";
echo "This project is done by Merna Hassan"; echo -e "\U0001F60E";
echo "-------------------------------------------";
if [[ -d ./DBs ]]
then	
	echo "Database Directory  exists on your filesystem.";echo -e "\U0001F9CF"

else
	mkdir DBs
	echo "Databses created successfully";echo -e "\U0001F973"	
fi
echo "--------------Main Menu:-------------------";
function MainMenu {
	select choice in "Create Database"  "List DataBases"   "Connect to Databases"  "Drop Database" "exit"
	do 
		case  $REPLY in 
		1)createDB; 
			;;
		2)ListDBs;
  			;;
		3)ConnectDB;
			;;
		4)DropDB;
			;;
		5)echo "Thanks for using our Script "; echo -e "\U0001F90D"	
			exit 
			;;
		*) echo $REPLY is not one of the options; echo -e "\U0001F926"
	esac
	done
	
}
createDB()
            {

                            read -p "Enter a Database name: " name


                              if [[ -z $name  ]];
                                then
                                        tput setaf 1
                                        echo "Empty Input"
                                        tput setaf 7
                                        createDB

                                elif [[ $name =~ ['!@#$%^&*()_+'] ]];
                                then
                                        tput setaf 1 ;
                                        echo "incorrect input"
                                        tput setaf 7
                                        createDB

                                else
                                        if [[ -d ./DBs/$name ]] ;
                                        then
                                                tput setaf 1
                                                echo "$name DB Already Exits"
                                                tput setaf 7
                                                createDB
                                        else

                                                mkdir  ./DBs/$name
                                                 echo " $name created successfully  "
                 
                                                 fi
                                     fi

            }

function ListDBs {
                                 ls ./DBs;
 }

function ConnectDB {
	echo " Enter your database's name: ";

	read DBname;
        if [[ -d ./DBs/$DBname ]]
        then
		cd ./DBs/$DBname;
                echo "You're connected successfully to database $DBname";
DBMenu;
        else
                echo "$DBname is not exists, please enter a valid database name or create new database";echo -e "\U0001F44A" 
        fi
}
function DropDB {
	echo " Enter your database's name: ";
	read DBname ;
	if [[ -d ./DBs/$DBname ]]
        then
		rm -r ./DBs/$DBname ;
                echo "Database  $DBname dropped successfully.";

        else
                echo " $DBname not exists on your databases, please try again with valid databse name";echo -e "\U0001F44A" 
        fi
	
}
function DBMenu {
	   select choice in "Create Table"  "List Tabless"   "Drop Table" "Insert Into Table" "Select From Table" "Delete From Table" "Update Table" "Back To Main Menu"  "Disconet This Database" "exit"
        do
                case  $REPLY in
                1)createTable;
                        ;;
                2)ListTables;
                        ;;
                3)DropTable;
                        ;;
                4)Insert
			;;
		5)Select
			;;
		6)Delete
			;;
		7)Update
			;;
		8)BMainMenu
			;;
		9)DisconetDB;
                        ;;
                10)echo "Thanks for using our Script "; echo -e "\U0001F90D"
                        exit
                        ;;
                *) echo $REPLY is not one of the options;echo -e "\U0001F926"

        esac
        done
}
function createTable {

        read -p  "Enter Table Name: " tableName
            
        if [[ -z $tableName  ]];
        then 
                tput setaf 1  
                echo "Empty Input"
                createTable

        
        elif [[ $tableName =~ ['!@#$%^&*()_+'] ]];
        then
                tput setaf 1  
                echo "wrong input"
                tput setaf 7  
               createTable 
               

        else 
	        if [[ -f $tableName ]] ;
	        then 
		        tput setaf 1  
		        echo $tableName Table Already Exits
		        createTable
	        else    
                
                        while true
		        do
		                tput setaf 7  
		                read -p "Enter Number of Columns: " NumberCol
		 
                                
                                        if [[ $NumberCol =~ [^1-9] ]]; 
                                        then
                                                tput setaf 1
                                                echo " input shoud be started from number 1"
                                                tput setaf 7

                                        elif [[ -z $NumberCol ]] ;
                                        then   
                                                tput setaf 1
                                                echo "Empty Input"
                                                tput setaf 7
                                        else
                                                break 
                                        fi
                        done
                

		        tput setaf 3  
		        echo "First Column Must Be PRIMARY KEY !!"
		        tput setaf 7  

                
                        for (( i = 1 ; i <= NumberCol ; i++ ));
                        do      
                                while true
                                do
                                        read -p "Write Column Name $i : " ColName
                                        
                                        
                                        if [[ $ColName =~ ['!@#$%^&*()_+'] ]]; then
                                                tput setaf 1  
                                                echo "incorrect input"
                                                tput setaf 7  

                                        elif [[ -z $ColName ]] ;
                                        then
                                                tput setaf 1 
                                                echo "Empty Column Name"
                                                tput setaf 7
                        
                                        else 
                                                break ;
                                        fi
                                done 

                                tput setaf 7  
                                read -p "Enter DataType of $ColName column[string/int] :" ColDataType

                                while [[ $ColDataType != int && $ColDataType != string ]];
                                do      tput setaf 1 
                                        echo "Wrong DataType, Enter Int Or String"
                                        tput setaf 7 
                                        read ColDataType
                                done

                                tput setaf 7 
                                touch $tableName
                                touch $tableName.type

                                if [[ i -eq NumberCol ]] ; then
                                        echo 	$ColName >> $tableName
                                        echo    $ColDataType>> $tableName.type
                                else
                                        echo -n $ColName":" >> $tableName 
                                        echo -n $ColDataType":" >> $tableName.type
                                fi
                                
                        done

                        echo "Table has been created Successfuly"
                        tput setaf 7 
	        fi
        fi

            }
function ListTables {

    echo "Available Tables :"
    ls

}
function DropTable {
	echo "Enter Table's name to be dropped:";
    read Tablename
    if [ -f $Tablename ]
    then
	    echo "Are you sure to DELETE this table?";
	    select choice in "press 1 if YES" "press 2 if NO"
        do
                case  $REPLY in

                    1 )  rm  -r  ./$Tablename
                         echo " $Tablename Table has been removed successfully!"
                    ;;
                    2 )
                        clear
                    ;;
            esac
    done
    else
        echo "$Tablename Table doesn't exist!"echo -e "\U0001F926"

    fi

}
function Delete {
        echo "Enter table's name:";
        read t_name;
        if [[ -f ./$t_name ]]
        then
               echo -n "" > $t_name
	       echo "Deleted from table $t_name succesfully";
        else
                echo "Please enter a valid/existing table name"; echo -e "\U0001F926"

        fi
}

function  DisconetDB {
	cd  .. ;
	cd  .. ;
	echo "Disconnected successfully";
	MainMenu;
}
function  BMainMenu {
	echo "---------------------Main Menu--------------------"
        cd  .. ;
	cd .. ;
        MainMenu;
}
   



function Select {

        read -p "Enter Name of table that you need to select it : "  tbName
        
        if [[ -f $tbName ]] ; then
        tput setaf 7
        echo "Please , Select one of these Options"
                select choice in "Select AllRecords" "Select Record"  "Select Column" "back_to_tablemenu"  
                do
                        case $choice in
                                "Select AllRecords" )
                                        column -t -s ':' $tbName.type
                                        column -t -s ':' $tbName
                                
                                        echo "select again :"
                                        ;;


                                "Select Record" )

                                   colname=`awk -F ":" '{if(NR==1) print $1}' $tbName`;

                                        read -p "Enter your $colname: " value

                                        if [[ -z $value ]] ; then
                                                tput setaf 1
                                                echo "Empty Input"
                                                tput setaf 7
                                                Select
                                        else
                                       
                                          if [[ $value =~ [`cut -d':' -f1 $tbName | grep -x $value`] ]]; then
            
                                          rec_no=$(awk 'BEGIN{FS=":"}{if ( $1 == "'$value'" ) print NR}' $tbName)

                                          echo $(awk 'BEGIN{FS=":";}{if ( NR == '$rec_no' ) print $0 }' $tbName)
                                                tput setaf 7
                                                echo "select again :"
                                               fi 
                                        fi 
                                        ;;
                                
                                "Select Column" )
                                        read -p "Enter Column Number you wanna select : " value 

                                        while ! [[ $value =~ ^[1-9]+$ ]]
                                        do
                                                tput setaf 1
                                                read -p "Column Number Must be Integer : " value 
                                                tput setaf 7

                                        done

                                                cut -d':' -f$value $tbName.type
                                                cut -d':' -f$value $tbName
                                                echo "select again :"
                                        ;;

                                "back_to_tablemenu" )

					DBMenu;
                                        ;;

                                
                                *)     
                                        tput setaf 1 
                                        echo "Please, Enter valid Number"
                                        tput setaf 7
                                        echo "select again :"
                                        ;;
                        esac
                done
        select_from_table
        else
        echo $tbName Table Doesnt Exits ;echo -e "\U0001F926"

        fi
}
function Insert {

        read -p "Enter Table Name You Wanna insert Into: "  tbName
                if [[ -f $tbName ]]; then
 	                typeset -i cntColumns=`awk -F: '{print NF}' $tbName | head -1` ; 
	                tput setaf 3  
                        echo "PRIMARY KEY MUST BE UNIQUE" 
                                for (( i=1 ; i <= $cntColumns ; i++ ));   
                                do
                                        colname=`awk -v"n=$i" 'BEGIN{FS=":"}{print $n}' $tbName | head -1` ; 
                                        coltype=`awk -v"n=$i" 'BEGIN{FS=":"}{print $n}' $tbName.type | head -1` ; 
                                        if [[ $i -eq 1 ]] ;
                                        then 
                                                check=0
                                                while [[ $check -eq 0 ]] ;
                                                do
                                                tput setaf 7       

                                                read -p "Enter Value for $colname Column: " value   
                                                if ! [[ -z $value ]]; then

                                                        if ! [[ $value =~ [`cut -d':' -f1 $tbName | grep -x $value`] ]]; then
                                                                if [[ $coltype = "int" && "$value" = +([0-9]) || $coltype = "string" && "$value" = +([a-zA-Z0-9@_.]) ]];
                                                                then		
                                                                echo -n  $value":" >> $tbName;
                                                                fi 
                                                        check=1
                                                        fi	
                                                fi
                                                done 
                                                                       
					fi

                                       
                                        flag=0
                                        while [[ $flag -eq 0 && $i -gt 1 ]];
                                        do
                                                tput setaf 7
                                                echo "Enter Value for $colname Column: "
                                                read value
                                                if [[ $coltype = "int" && "$value" = +([0-9]) || $coltype = "string" && "$value" = +([a-zA-Z0-9@_.]) ]]; then
                                                        if [[ $i == $cntColumns ]]; then
                                                                echo $value >> $tbName;
                                                        else
                                                                echo -n  $value":" >> $tbName;
                                                        fi
                                                flag=1;
                                                fi
                                        done
                                        
                                done
                else	        
                        tput setaf 7  
                        echo "Sorry $tbName Doesn't Exist";
                        tput setaf 7 
                fi  
}


function Update {

        echo "Enter Table's name you want to Update:"
read Table_name

while [ ! -f $Table_name ]
do
echo " $Table_name not exists in you tables, please try again with valid table name";echo -e "\U0001F44A"
read Table_name
done

echo "Enter data's ID which you want to Update:"
typeset -i id
read id
while ! [ $(grep -w "$id" $Table_name) ]
do
echo "ID not exist , try again!"
read id
done

echo -e "\n"
echo $(awk -F"," 'NR==1{print $1}' $Table_name)
echo $(awk -F"," ''/$id/'{ print $1}' $Table_name)
echo "enter the old record that you want to update "
read old
while ! [ $(grep -w "$old" $Table_name) ]
do
echo "data not exist , try again!"
read old
done

echo "Enter new record: "
read new
sed -i "s/\b$old\b/$new/g"  ./$Table_name >> ./$Table_name;
echo "Updating done Successfully";



}












MainMenu;
