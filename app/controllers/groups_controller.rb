class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  # GET /groups or /groups.json
  def index
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @groups = Group.includes(:user).where(user_id: current_user.id)
    end
  end

  # GET /groups/1 or /groups/1.json
  def show
    @gro = Group.includes(:user).find_by(id: params[:id])
    if current_user.nil?
      redirect_to new_user_session_path
    elsif current_user.id != @gro.user_id
      redirect_to root_path
    end
  end

  # GET /groups/new
  def new
    @group = Group.new
    @icon = [{ name: 'Mac', slug: 'mac' }, { name: 'Samsung', slug: 'samsung' },
             { name: 'Asus', slug: 'asus' }, { name: 'Amazon', slug: 'amazon' },
             { name: 'Microsoft', slug: 'microsoft' },
             { name: 'AliExpress', slug: 'aliexpress' },
             { name: 'Tesla', slug: 'tesla' }, { name: 'HP', slug: 'hp' },
             { name: 'Sony', slug: 'sony' }]
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to root_path, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
