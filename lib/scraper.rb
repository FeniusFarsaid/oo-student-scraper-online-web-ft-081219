require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    students = []
    binding.pry 
    page.css("div.student-card").each do |student|
      name = student.css("student-name").text 
      location = student.css("student-location").text
      profile_url = student.css("a").attribute("href").value
        student_hashes = {
          :name => name, :location => location, 
          :profile_url => profile_url}
      student << student_hashes
    end 
    student
  end 
    
    
    
    
    # id="ryan-johnson-card">
    #         <a href="students/ryan-johnson.html">
    #           <div class="view-profile-div">
    #             <h3 class="view-profile-text">View Profile</h3>
    #           </div>
    #           <div class="card-text-container">
    #             <h4 class="student-name">Ryan Johnson</h4>
    #             <p class="student-location">New York, NY</p>
    #           </div>
    #         </a>
    #       </div>)
    
    
  

  def self.scrape_profile_page(profile_url)
    
  end

end

