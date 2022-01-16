module ApplicationHelper

 def alcohol_conumption(number)
  case number
  when 1
    "very low"
  when 2
    "low"
  when 3
    "medium"
  when 4
    "high"
  when 5
    "very high"
  end               
 end
end
