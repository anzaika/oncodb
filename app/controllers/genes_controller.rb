class GenesController < ApplicationController
  before_action :set_gene, only: [:show, :edit, :update, :destroy]

  # GET /genes
  # GET /genes.json
  def index
    if params[:drug_id]
      @genes = Drug.find(params[:drug_id]).genes
    elsif params[:disease_id]
      @genes = Disease.find(params[:disease_id]).genes
    else
      @genes = Gene.all
    end

    respond_to do |format|
      format.tsv {send_data @genes.to_tsv}
    end
  end

  # GET /genes/1
  # GET /genes/1.json
  def show
    @drugs = @gene.drugs.paginate(page: params[:drug_page])
    @diseases = @gene.diseases.paginate(page: params[:disease_page])
  end

  # GET /genes/new
  def new
    @gene = Gene.new
  end

  # GET /genes/1/edit
  def edit
  end

  # POST /genes
  # POST /genes.json
  def create
    @gene = Gene.new(gene_params)

    respond_to do |format|
      if @gene.save
        format.html { redirect_to @gene, notice: 'Gene was successfully created.' }
        format.json { render :show, status: :created, location: @gene }
      else
        format.html { render :new }
        format.json { render json: @gene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /genes/1
  # PATCH/PUT /genes/1.json
  def update
    respond_to do |format|
      if @gene.update(gene_params)
        format.html { redirect_to @gene, notice: 'Gene was successfully updated.' }
        format.json { render :show, status: :ok, location: @gene }
      else
        format.html { render :edit }
        format.json { render json: @gene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genes/1
  # DELETE /genes/1.json
  def destroy
    @gene.destroy
    respond_to do |format|
      format.html { redirect_to genes_url, notice: 'Gene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gene
      @gene = Gene.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gene_params
      params.require(:gene).permit(:drug_page, :disease_page, :name, :source, :description, :uniprotKB, :ensemblID, :entrezID, :pharmGkbID, :drugbankTargetID)
    end
end
