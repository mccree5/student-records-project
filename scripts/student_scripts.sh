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
    sudo -u postgres psql -d "$db_name" -f "sql/schema.sql"
    echo "Database setup complete."
}

