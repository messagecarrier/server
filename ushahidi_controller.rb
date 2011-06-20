
  before '/ushahidi*' do
    DB = Sequel.sqlite('messagecarrier.db')
    dataset = DB[:ushahidi]
  end
 
  get '/ushahidi/' do
    DB = Sequel.sqlite('messagecarrier.db')
    dataset = DB[:ushahidi]
   
    @ushahidii = dataset
    
    erb :u_index
  end

  get '/ushahidi/new' do
    dataset = DB[:ushahidi]
    
    erb :u_new
  end

  post '/ushahidi/create' do
     DB = Sequel.sqlite('messagecarrier.db')
     dataset = DB[:ushahidi]
    
    ushahidi = dataset.insert(params.merge!(:uid=>Time.new.to_i))
    
      redirect '/ushahidi/'
  end



  get '/ushahidi/delete/:id' do
     DB = Sequel.sqlite('messagecarrier.db')
    dataset = DB[:ushahidi]
    record = dataset.filter("uid=?",params[:id])
    record.delete
    redirect '/ushahidi/'
  end
