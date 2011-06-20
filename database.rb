require 'sequel'
require 'sqlite3'
require 'sinatra/sequel'

set :database, 'sqlite://messagecarrier.db'

migration "create the messages table" do
  database.create_table :messages do
    String	:messageid, :primary_key => true
    String		:destination 
    int			:hopcount
    text		:messagebody
    int			:messagetype
    String		:sourceid
    int			:status
    text		:sendername
	String		:location
    timestamp	:timestamp
    int         :messagestatus
  end
end

migration "create the ushahidi table" do
  database.create_table :ushahidi do
    int :uid , :primary_key=>true , :autoincrement=>true
    String		:url
    float	  :lat
    float 	:lon
    int			:radius
  end
end


