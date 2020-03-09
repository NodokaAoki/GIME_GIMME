class Admin::ModelsController < AdminController
  def index
    @models = Model.all
    @model = Model.new
  end

  def create
    @model = Model.new(params_model)
    @model.save!
    @models = Model.all
    redirect_to admin_models_path
  end

  def update
    @model = Model.find(params[:id])
    @model.update(params_model)
    @model.save
    redirect_to admin_models_path
  end

  private
    def params_model
      params.require(:model).permit(:model)
    end
end
