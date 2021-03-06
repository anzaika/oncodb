class DiseasesController < ApplicationController
  before_action :set_disease, only: [:show, :edit, :update, :destroy]

  # GET /diseases
  # GET /diseases.json
  def index
    if params[:gene_id]
      @diseases = Gene.find(params[:gene_id]).diseases
    elsif params[:drug_id]
      @diseases = Drug.find(params[:drug_id]).diseases
    else
      @diseases = Disease.all
    end

    respond_to do |format|
      format.tsv {send_data @diseases.to_tsv}
    end
  end

  # GET /diseases/1
  # GET /diseases/1.json
  def show
    @drugs = @disease.drugs.paginate(page: params[:drug_page])
    @genes = @disease.genes.paginate(page: params[:gene_page])
  end

  # GET /diseases/new
  def new
    @disease = Disease.new
  end

  # GET /diseases/1/edit
  def edit
  end

  # POST /diseases
  # POST /diseases.json
  def create
    @disease = Disease.new(disease_params)

    respond_to do |format|
      if @disease.save
        format.html { redirect_to @disease, notice: 'Disease was successfully created.' }
        format.json { render :show, status: :created, location: @disease }
      else
        format.html { render :new }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diseases/1
  # PATCH/PUT /diseases/1.json
  def update
    respond_to do |format|
      if @disease.update(disease_params)
        format.html { redirect_to @disease, notice: 'Disease was successfully updated.' }
        format.json { render :show, status: :ok, location: @disease }
      else
        format.html { render :edit }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diseases/1
  # DELETE /diseases/1.json
  def destroy
    @disease.destroy
    respond_to do |format|
      format.html { redirect_to diseases_url, notice: 'Disease was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disease
      @disease = Disease.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disease_params
      params.require(:disease).permit(:gene_page, :drug_page, :name, :alt_names, :source, :type, :pharmGkbID)
    end
end
