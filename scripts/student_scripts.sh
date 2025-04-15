db_name="student_db"
db_user="student_admin"

check_postgres() {
    if pg_isready -q; then
        echo "PostgreSQL is running."
    else
        echo "PostgreSQL is not running. Please start it first."
        exit 1
    fi
}

setup_database() {
    echo "Setting up the database..."
    sudo -u postgres psql -d "$db_name" -f "../sql/schema.sql"
    echo "Database setup complete."
}

seed_data() {
    echo " Seeding database with test student data..."
    sudo -u postgres psql -d "$db_name" -f "../sql/seed.sql"
    echo "✅ Seeding complete."
}

query_students() {
    echo " Fetching student records..."
    sudo -u postgres psql -d "$db_name" -f "../sql/queries.sql"
    echo "----------------------------"
    echo "Press Enter to return to the menu."
    read
}

insert_students() {
    echo "Enter student full name:"
    read name
    if [ -z "$name" ]; then
        echo "❌ Name cannot be empty."
        return
    fi

    echo "Enter student major:"
    read major
    if [ -z "$major" ]; then
        echo "❌ Major cannot be empty."
        return
    fi

    echo "Enter student classification (Freshman, Sophomore, etc.):"
    read class
    if [ -z "$class" ]; then
        echo "❌ Classification cannot be empty."
        return
   fi
        
    echo "Enter current club status (Member, Officer, Guest)"
    read membership
    if [ -z "$membership" ]; then 
    	echo "❌ Club status cannot be empty"
    	return    
    fi

    sudo -u postgres psql -d "$db_name" -c \
        "INSERT INTO students (name, major, class, membership) VALUES ('$name', '$major', '$class', '$membership');"

    echo "✅ Student added successfully!"
}


backup_database() {
    echo "Backing up the database..."
    sudo -u postgres pg_dump "$db_name" > "../backup/student_db_backup_$(date +"%Y%m%d_%H%M%S").sql"
    echo "✅ Backup complete. The backup is saved as student_db_backup_$(date +"%Y%m%d_%H%M%S").sql in the backup folder."
}


# ------------------ Menu Loop ------------------ #
while true; do
    echo ""
    echo "==============================="
    echo "  🎓 Student Records Manager"
    echo "==============================="
    echo "1. Setup Database"
    echo "2. Seed Test Data"
    echo "3. Query Students"
    echo "4. Insert New Student"
    echo "5. Backup Database"
    echo "6. Exit"
    echo "-------------------------------"
    read -p "Select an option (1-6): " choice

    case $choice in
        1) setup_database ;;
        2) seed_data ;;
        3) query_students ;;
        4) insert_students ;;
        5) backup_database ;;
        6) echo "👋 Exiting. Goodbye!" && exit 0 ;;
        *) echo "❌ Invalid option. Please enter a number from 1 to 6." ;;
    esac
done


