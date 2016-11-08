#!/usr/bin/ruby -w
# coding: utf-8


require "sqlite3"

=begin
# Create a database
rows = db.execute <<-SQL
  create table numbers (
    name varchar(30),
    val int
  );
SQL

# Execute a few inserts
{
  "one" => 1,
  "two" => 2,
}.each do |pair|
  db.execute "insert into numbers values ( ?, ? )", pair
end

# Execute inserts with parameter markers
db.execute("INSERT INTO students (name, email, grade, blog) 
            VALUES (?, ?, ?, ?)", [@name, @email, @grade, @blog])
=end

class SqliteStudy
	def initialize(args)
		@ticket_table_fields = {'tkt_id' => 0, 'tkt_uuid' => 1, 'tkt_mtime' => 2, 'type' => 3, 'status' => 4, 'project' => 5, 'subproject' => 6, 'priority' => 7, 'owner' => 8, 'eva' => 9, 'version' => 10, 'resolution' => 11, 'title' => 12, 'comment' => 13}

		if args.length < 1
			sqlite_study_usage
			return
		end

		# Open a database
		@db = SQLite3::Database.new args[0]
		if !@db
			puts "can not open sqlite3 database #{args[0]}"
			return
		end

		args.shift
		arguments_parse(args)

		@db.close
	end

	def arguments_parse(args)
		if args[0] == "show"
			args.shift
			show_table(args[0])
		else
			sqlite_study_usage
		end
	end

	def show_table(table)
		@db.execute("select * from #{table}") do |row|
			puts row[@ticket_table_fields['project']]
			puts row[@ticket_table_fields['title']]
			puts ''
		end
	end

	def sqlite_study_usage
    		puts "sqlite_study usage:"
    		puts "ruby sqlite_study <sqlite database file> show <table name>"
	end
end

SqliteStudy.new ARGV
