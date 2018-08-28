class WorksController < ApplicationController
  def index
    @works = []
    current_dir = "#{Rails.root}/public/parts/#{params[:name]}"
    Dir.entries(current_dir).each do |file_name|
      if File.file?("#{current_dir}/#{file_name}")
        @works << "/parts/#{params[:name]}/#{file_name}"
      end
    end
  end

  def destroy
    current_dir = "#{Rails.root}/public/"
    File.delete("#{current_dir}/#{params[:file_name]}")

    redirect_to "/parts/#{params[:part_id]}"
  end
end
