class Admin::Challenge
  include ActiveModel::Model

  STATUSES = ['Created', 'Completed', 'Hidden', 'Review', 'Submission', 'Winner Selected', 'No Winner Selected', 'On Hold - Pending Reviews']
  PRIZE_TYPES = ['Currency', 'Other']

  # Overrides the attr_accesssor class method so we are able to capture and
  # then save the defined fields as column_names
  def self.attr_accessor(*vars)
    @column_names ||= []
    @column_names.concat( vars )
    super
  end

  # Returns the previously defined attr_accessor fields
  def self.column_names
    @column_names
  end

  attr_accessor :winner_announced, :terms_of_service, :scorecard_type, :submission_details,
                :status, :start_date, :requirements, :name, :status, :end_date, :description,
                :reviewers, :categories, :prizes, :commentNotifiers, :reviewers_to_delete,
                :categories_to_delete, :prizes_to_delete, :commentNotifiers_to_delete

  def statuses
    Admin::Challenge::STATUSES
  end

end

# {
#   "challenge" : {
#     "detail" : {
#       "winner_announced":"2015-05-17",
#       "terms_of_service":"Standard Terms & Conditions",
#       "scorecard_type":"Sandbox Scorecard",
#       "submission_details":"<em>&#39;Some submission details&#39;<br><br>Another double quoted stuff &quot;fdfdfd&quot;</em>",
#       "status":"Hidden",
#       "start_date":"2012-03-17T18:02:00.000+0000",
#       "requirements":"Hello this is a sample requirement with some interesting stuff like<br><br>Bullets<br><ul><li>Bull1</li><li>Bull2</li></ul>\n<div style=\"text-align: center; \">Links <br><br><a href=\"http://developer.force.com\" target=\"_blank\">http://developer.force.com<br></a><br><strong>Bold Text</strong></div>\n<br><strike><em>Crossed - Italics<br></em></strike><br><br>",
#       "name":"RSpec Challenge",
#       "status":"Planned",
#       "end_date":"2014-04-17T18:02:00.000+0000",
#       "description":"sample Description"
#       }, 
#     "reviewers" : [{"name" : "mess"}, {"name" : "jeffdonthemic"}],
#     "categories" : [{"name" : "java"}, {"name": "heroku"}],
#     "prizes" : [{"place":2,"points":222,"prize":"122","value":1212}, {"place":1,"points":2120,"prize":"1000","value":21212}],
#     "commentNotifiers" : [{"email" : "jdouglas@appirio.com"}, {"name" : "mess"}],
#     "reviewers_to_delete" : [{"name" : "mess"}, {"name" : "jeffdonthemic"}],
#     "categories_to_delete" : [{"name" : "java"}, {"name": "heroku"}],
#     "prizes_to_delete" : [{"place":2,"points":222,"prize":"122","value":1212}, {"place":1,"points":2120,"prize":"1000","value":21212}],
#     "commentNotifiers_to_delete" : [{"email" : "jdouglas@appirio.com"}, {"name" : "mess"}]
#   }
# }