class DrugsController < ApplicationController
  before_action :set_drug, only: [:show, :edit, :update, :destroy]

  # GET /drugs
  # GET /drugs.json
  def index
    if params[:gene_id]
      @drugs = Gene.find(params[:gene_id]).drugs
    elsif params[:disease_id]
      @drugs = Disease.find(params[:disease_id]).drugs
    else
      @drugs = Drug.all
    end

    respond_to do |format|
      format.tsv {send_data @drugs.to_tsv}
    end
  end

  # GET /drugs/1
  # GET /drugs/1.json
  def show
    @genes = @drug.genes.paginate(page: params[:gene_page])
    @diseases = @drug.diseases.paginate(page: params[:disease_page])
  end

  # GET /drugs/new
  def new
    @drug = Drug.new
  end

  # GET /drugs/1/edit
  def edit
  end

  # POST /drugs
  # POST /drugs.json
  def create
    @drug = Drug.new(drug_params)

    respond_to do |format|
      if @drug.save
        format.html { redirect_to @drug, notice: 'Drug was successfully created.' }
        format.json { render :show, status: :created, location: @drug }
      else
        format.html { render :new }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drugs/1
  # PATCH/PUT /drugs/1.json
  def update
    respond_to do |format|
      if @drug.update(drug_params)
        format.html { redirect_to @drug, notice: 'Drug was successfully updated.' }
        format.json { render :show, status: :ok, location: @drug }
      else
        format.html { render :edit }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drugs/1
  # DELETE /drugs/1.json
  def destroy
    @drug.destroy
    respond_to do |format|
      format.html { redirect_to drugs_url, notice: 'Drug was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drug
      @drug = Drug.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drug_params
      params.require(:drug).permit(:gene_page, :disease_page, :name, :description, :drugbankID, :pharmGkbID, :fdaApproved, :source)
    end
end
