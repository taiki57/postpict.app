class InformationController < ApplicationController
require 'mechanize'

    def home

      agent = Mechanize.new
    
      page = agent.get("https://datawokagaku.com/?s=docker")
    
      @elements= page.search('.post-list-card a')

    end
    
    def scrape
        agent = Machanize.new
        page = agent.get("https://www.ap-siken.com/index_ma.html#15_1")
        elements = page.search('a')
        puts elements
    end
    
    

end
