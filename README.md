<h1 align="center">Meteo Forecast</h1>

A simple console meteo forecast, which works with [meteoservice](https://www.meteoservice.ru). Can be customized to show the weather in any city, supported by meteoservice. 
A training project as part of Ruby / Ruby on Rails coding bootcamp goodprogrammer.ru. It shows mainly the ability to work with the net.

Programming language - **Ruby**.
## Requirements
* Ruby 2.6.1 or higher

## How to use
The program uses the command line. To start usage:
1. Download the repository using the [instruction](https://help.github.com/en/articles/cloning-a-repository).
2. In the command line go to the directory with the files downloaded.
3. Install required gems. To do that:
   1. Check if the bundler is installed with the command `gem list bundler`
      * If it is not installed - installed it with the command `gem install bundler`.
      * If bundler is already installed, that is perfect. Go to the next step.
   2. In the directory with the game, to install all necessary gems run `bundle install`
4. To start playing run 
```console
bundle exec ruby main.rb
```
**It is important** to use `bundle exec` to make the necessary versions of gems to be used.

5. Follow the instructions
## Features and settings
* The program needs internet connection. If it does not work please check your internet connection first.
* By default the program is able to show the forecast for 7 preset cities. That can be changed in the constant `CITIES` by using ids from [dictionary](https://www.meteoservice.ru/content/export);
* To choose the city just put the number of it and push **Enter**. 

**Example:**
```console
Please choose the number of city to receive the forecast
1. Copenhagen
2. Murmansk
3. Cairo
4. Batumi
5. Dubai
6. Belgrade
7. Vancouver
```
Let's pretend, you are looking for the forecast for Vancouver. So, you put `7` and pushes **Enter**. The output:
```console
Today, day
5..6, wind 1 meters per sec, mainly clear
Today, evening
2..6, wind 1 meters per sec, mainly clear
Tomorrow, night
0..2, wind 1 meters per sec, mainly clear
Tomorrow, morning
0..5, wind 1 meters per sec, mainly clear
```
