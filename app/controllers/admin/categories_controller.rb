class Admin::CategoriesController < AdminController
	
	before_filter :find_category, :only => [:destroy, :update, :edit]

	def index
		@categories = Category.order('created_at DESC').page(params[:page]).per(15)
	end

	def new
		@category = Category.new
	end

	def edit
	
	end

	def create
		@category = Category.new category_attributes
		if @category.save
			flash[:notice] = 'Category successfully created'
			redirect_to admin_categories_path
		else
			flash[:notice] = @category.errors.full_messages.join(", ")
			render action: 'new'
		end
	end

	def update
		if @category.update_attributes category_attributes
			flash[:notice] = 'Category successfully created'
			redirect_to admin_categories_path
		else
			flash[:notice] = @category.errors.full_messages.join(", ")
			render action: 'edit'
		end
	end

	def destroy
		if @category.destroy
			flash[:notice] = 'Category successfully removed'
		else
			flash[:notice] = @category.errors.full_messages.join(", ")
		end
		redirect_to admin_categories_path
	end

	private
		def category_attributes
			params.require(:category).permit(:name, :parent_id)
		end

		def find_category
			@category = Category.find(params[:id])
		end

		def model_class
			
		end
end