class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :price, :year, :url, :medium_image_src, :thumb_image_src

  def thumb_image_src
    "https://s3.amazonaws.com/lina_project_2_api/books/images/000/000/0#{object.id}/thumb/#{object.image_file_name}"
  end

  def medium_image_src
    "https://s3.amazonaws.com/lina_project_2_api/books/images/000/000/0#{object.id}/medium/#{object.image_file_name}"
  end
end
