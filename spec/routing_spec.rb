# coding: utf-8
require 'spec_helper'

describe MogileImage do
  it{ { :get => '/image/raw/0123456789abcdef0123456789abcdef.jpg' }.should route_to(:controller => 'mogile_images', :action => 'show', :size => 'raw', :name => '0123456789abcdef0123456789abcdef', :format => 'jpg') }
  it{ { :get => '/image/1x2/0123456789abcdef0123456789abcdef.gif' }.should route_to(:controller => 'mogile_images', :action => 'show', :size => '1x2', :name => '0123456789abcdef0123456789abcdef', :format => 'gif') }
  it{ { :get => '/image/200x100/0123456789abcdef0123456789abcdef.png' }.should route_to(:controller => 'mogile_images', :action => 'show', :size => '200x100', :name => '0123456789abcdef0123456789abcdef', :format => 'png') }
  it{ { :get => '/image/200x100fill/0123456789abcdef0123456789abcdef.png' }.should route_to(:controller => 'mogile_images', :action => 'show', :size => '200x100fill', :name => '0123456789abcdef0123456789abcdef', :format => 'png') }
  it{ { :get => '/image/200x100frame/0123456789abcdef0123456789abcdef.png' }.should route_to(:controller => 'mogile_images', :action => 'show', :size => '200x100frame', :name => '0123456789abcdef0123456789abcdef', :format => 'png') }
  it{ { :get => '/image/200x100frame5/0123456789abcdef0123456789abcdef.png' }.should route_to(:controller => 'mogile_images', :action => 'show', :size => '200x100frame5', :name => '0123456789abcdef0123456789abcdef', :format => 'png') }
  it{ { :post => '/image/flush' }.should route_to(:controller => 'mogile_images', :action => 'flush') }
  it{ { :get => '/image/raw/0123456789abcdef0123456789abcdef' }.should_not be_routable }
  it{ { :get => '/image/raw/0123456789abcdef0123456789abcdef' }.should_not be_routable }
  it{ { :get => '/image/raw/0123456789abcdef0123456789abcdef.pdf' }.should_not be_routable }
  it{ { :post => '/image/raw/0123456789abcdef0123456789abcdef.jpg' }.should_not be_routable }
  it{ { :put => '/image/raw/0123456789abcdef0123456789abcdef.jpg' }.should_not be_routable }
  it{ { :delete => '/image/raw/0123456789abcdef0123456789abcdef.jpg' }.should_not be_routable }
  it{ { :get => '/image/flush' }.should_not be_routable }
  it{ { :put => '/image/flush' }.should_not be_routable }
  it{ { :delete => '/image/flush' }.should_not be_routable }
  it{ { :get => '/image/' }.should_not be_routable }
end
