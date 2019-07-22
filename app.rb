require('pry')
require('rspec')
require('sinatra')
require('sinatra/reloader')
require('./lib/album')
also_reload('lib/**/*.rb')


get ('/') do
  @albums = Album.all
  erb(:albums)
end

get ('/albums') do
  @albums = Album.all
  erb(:albums)
end

get ('/albums/new') do
  erb(:newalbum)
end

get ('/albums/:name') do
  @album = Album.find(params[:name])
  erb(:album)
end


post ('/albums') do
  name = params[:album_name]
  album = Album.new(name)
  album.save()
  @albums = Album.all()
  erb(:albums)
end

get ('/albums/:name/edit') do
  @album = Album.find(params[:name])
  erb(:edit_album)
end

patch ('/albums/:name') do
  @album = Album.find(params[:name])
  @album.update(params[:newname])
  @albums = Album.all
  erb(:albums)
end

delete ('/albums/:name') do
  @album = Album.find(params[:name])
  @album.delete(params[:name])
  @albums = Album.all
  erb(:albums)
end

get ('/custom_route') do
  "We can even create custom routes, but we should only do this when needed."
end
