class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave


# linea 6 ha 17 es un modo mas DRY to approach phot uploader
  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  #esto es para que una vez subida una foto por defecto sea de estas dimensiones 256,256
  version :thumnail do
    resize_to_fit 256, 256
  end
#show.html.erb/linea4--- estas lineas lo que hacen esque si me canso de escribir lo que aparece en show.html.erb linea 4
#lo defino en este block of code and then I can call it like this: <%= image_tag @article.photo.url(:bright_face) %>

  version :bright_face do
    cloudinary_transformation effect: "brightness:30", radius: 20,
      width: 150, height: 150, crop: :thumb, gravity: :face
  end

end
