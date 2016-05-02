module DrugsHelper
  def arel_for_drug(_filter)
    # t = Drug.arel_table
    #
    # r = t['drug_id'].eq(0)
    # r = r.or(t[:name].matches("%#{filter}%"))
    # r = r.or(t[:description].matches("%#{filter}%"))

    Drug.none
  end
end
