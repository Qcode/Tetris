local gridWidth = 10
local gridHeight = 24
local gridSize = 16
local grid = {}

function love.load()
    for x = 0, gridWidth - 1 do
        grid[x] = {}
        for y = 0, gridHeight - 1 do
            grid[x][y] = false
        end
    end
end

function love.update(dt)
end

function love.draw()
    love.graphics.push()
    love.graphics.translate(100, 100)
    love.graphics.rectangle('line', 0, 0, gridWidth*gridSize, gridHeight*gridSize)
    for x = 0, gridWidth - 1 do
        for y = 0, gridHeight - 1 do
            local fillMode = grid[x][y] and 'fill' or 'line'
            love.graphics.rectangle(fillMode, x*gridSize, y*gridSize, gridSize, gridSize)
        end
    end
    love.graphics.pop()
end

function love.keypressed(key)
end
