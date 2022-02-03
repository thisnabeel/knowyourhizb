if ActiveRecord::Base.connection.table_exists? 'scriptures'
    Cult.rehash
end