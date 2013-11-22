class FileController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def upload
    p params
    data=params[:file]
    File.open('./tmp/files/'+ data.original_filename, 'wb') do |of|
      of.write(data.read)
    end
    render :text => "Uploaded!"
  end
end
