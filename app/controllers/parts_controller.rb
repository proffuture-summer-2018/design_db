class PartsController < ApplicationController
  def index

    @parts = Part.all
  end

  def new
  end

  def show
    @part = Part.find(params[:id])

    @works = []
    current_dir = "#{Rails.root}/public/parts/#{@part.id}"
    if Dir.exists? (current_dir)
      Dir.entries(current_dir).each do |file_name|
        if File.file?("#{current_dir}/#{file_name}")
          @works << "/parts/#{@part.id}/#{file_name}"
        end
      end
    end
  end

  def create
    @part = Part.create(
      name: params[:name],
      surname: params[:surname],
      thirdname:params[:thirdname])

    redirect_to "/parts"
  end

  def update
    @part = Part.update(name: params[:name],
    surname: params[:surname],
    thirdname:params[:thirdname])

    redirect_to "/parts"
  end

  def destroy
    Part.destroy(params[:id])
  end

  private
  def sort_array(array)

    i = 0
    while i < array.length - 1
      min_index = i
      j = i + 1
      while j < array.length
        if array[min_index][:name] > array[j][:name]
          min_index = j
        end
        j += 1
      end
      buf = array[i]
      array[i] = array[min_index]
      array[min_index] = buf
      i += 1
    end
  end
end
