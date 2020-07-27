
[1mFrom:[0m /home/ec2-user/environment/artist-mining/app/controllers/artists_controller.rb:19 ArtistsController#search:

    [1;34m11[0m: [32mdef[0m [1;34msearch[0m
    [1;34m12[0m:   [1;34m# 検索機能 [0m
    [1;34m13[0m:   input_name = params[[33m:name[0m]
    [1;34m14[0m:   pick_genres = params[[33m:genres[0m]
    [1;34m15[0m:   pick_feelings = params[[33m:feelings[0m]
    [1;34m16[0m:   
    [1;34m17[0m:   binding.pry
    [1;34m18[0m:   
 => [1;34m19[0m:   [32mif[0m input_name.empty? && pick_genres.nil? && pick_feelings.nil?
    [1;34m20[0m:     flash[[33m:danger[0m] = [31m[1;31m'[0m[31m検索条件を指定してください。[1;31m'[0m[31m[0m
    [1;34m21[0m:     redirect_to root_path
    [1;34m22[0m:   [32mend[0m
    [1;34m23[0m:   
    [1;34m24[0m:   @artists = [1;34;4mArtist[0m.search(input_name, pick_genres, pick_feelings)
    [1;34m25[0m: [32mend[0m

