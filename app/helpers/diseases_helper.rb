module DiseasesHelper
  def arel_for_disease(_filter)
    # t = Disease.arel_table
    # r = t['disease_id'].eq(0)
    # r = r.or(t[:name].matches("%#{filter}%"))
    # r = r.or(t[:source].matches("%#{filter}%"))

    Disease.none
  end
end
