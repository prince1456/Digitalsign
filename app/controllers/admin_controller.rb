class AdminController < ApplicationController

  def admin
    @user = User.all
    @user2 = User.where("created_at >= ?", Time.zone.now.beginning_of_day)
    @templates = Template.all
    @pages = Page.all
    @page =Template.where("created_at >= ?", Time.zone.now.beginning_of_day)

    @bar = Gchart.bar(
      :size => '600x400',
      :bar_colors => ['0a98b7', 'ba0f84'],
      :bg => 'EFEFEF',
      :title => "statestic of site",
      :legend =>["today", "Total"],
      :data => [[@user.count, @pages.count, @templates.count, ],[ @user2.count , @page.count]],
      :orientation => 'vertical',
      :stacked => false,
      :legend_position =>"bottom",
      :axis_with_labels => [['r'], ['y']],
      :max_value => @pages.count + @page.count,
      :max_value => 10,
      :min_value => 0,
      :axis_labels => [["user| pages | templates"]],
      :bar_width_and_spacing => '100,70'
    )

    @markers = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow build_info_window(user)
      marker.picture(url: 'http://www.travelzoo.com/ca/local-deals/img/gmap-markers/map_marker_off_restaurant.png',
                     width: 32,
                     height: 32)
    end
  end

  private
  def build_info_window(user)
    "<div id='iw-container'>
      <div class='iw-title'>
          #{user.first_name}
      </div>
       <div class='gm-style-iw'>
          <p>#{user.street_line}
            <br>
            website: #{user.email}
            <br>
            <a style='color: blue;' href='/users/#{user.id}'>View Details </a>
            <br>
            #{user.pages.count}
          </p>

    </div>"

  end
end
