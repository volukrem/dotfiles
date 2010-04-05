----------------------
-- Random Wallpaper Package For Awesome WM
-- Azer Koculu <azerkoculu@gmail.com>
-- Blog: http://azer.kodfabrik.com
--
-- EXAMPLE USAGE
-- ------------
-- require "wallpaper"
-- theme.wallpaper_cmd = "awsetbg " .. wallpaper.pick( wallpaper.collect { "/home/foo/pic/wal1", "/home/foo/pic/wal2" } )
--
----------------------
local image_extensions = { jpg=true, png=true }

-- test whether given filename is an image
local function is_image(filename)
 return image_extensions[filename:match("%.(%w+)$")]
end

-- gather images from the passed directories
local function collect(dirs)
  local images = {}
  for i=1,table.getn(dirs),1 do
    local dir = dirs[i]
    for file in io.popen("ls "..dir):lines() do
      if is_image(file) then
        table.insert(images,dir .."/".. file)
      end
    end
  end
  return images
end

-- pick a random item from given table
local function pick(t)
  n = table.getn(t)
  if n > 0 then
   math.randomseed(os.time()+n)
   el = t[math.random( n )]
  end
  return el
end

-- declare exports
wallpaper = {
  extensions=image_extensions,
  collect=collect,
  pick=pick
}

return wallpaper
