Before ('@reset_users') do
  # Save user table data
  save_table("game_user")
end

After ('@reset_users') do
  # Reload user table data
  load_table("game_user")
end

Before ('@reset_families') do
  save_table("m_family")
  save_table("m_family_address")
end

After ('@reset_families') do
  load_table("m_family")
  load_table("m_family_address")
end

def save_table(table_name)
  run "mysqldump -u #{@@test_database_username} --password=#{@@test_database_password} #{@@test_database_name} #{table_name}> /tmp/#{table_name}"

end

def load_table(table_name)
  run "mysql -u #{@@test_database_username} --password=#{@@test_database_password} #{@@test_database_name} < /tmp/#{table_name}"
end
