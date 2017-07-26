math.randomseed(os.time())
for x = 1, 5 do
    math.random()
end

local gridWidth = 10
local gridHeight = 24
local gridSize = 16
local grid = {}

local tetrominoes = {
    {
        {false, true, false, false},
        {false, true, false, false},
        {false, true, false, false},
        {false, true, false, false}
    },
    {
        {false, true, true, false},
        {false, true, false, false},
        {false, true, false, false},
        {false, true, false, false}
    },
    {
        {false, true, true, false},
        {false, false, true, false},
        {false, false, true, false},
        {false, false, true, false}
    },
    {
        {false, false, false, false},
        {false, true, true, false},
        {false, true, true, false},
        {false, false, false, false}
    },
    {
        {false, false, false, false},
        {false, true, false, false},
        {true, true, true, false},
        {false, false, false, false}
    },
    {
        {false, false, true, true},
        {false, true, true, false},
        {false, false, false, false},
        {false, false, false, false}
    },
    {
        {true, true, false, false},
        {false, true, true, false},
        {false, false, false, false},
        {false, false, false, false}
    }
}

function love.load()
    for x = 0, gridWidth - 1 do
        grid[x] = {}
        for y = 0, gridHeight - 1 do
            grid[x][y] = false
        end
    end

    tetromino = newTetromino()
    print(tetromino.layout[1][1])
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

    for x = 0, 3 do
        for y = 0, 3 do
            if tetromino.layout[x+1][y+1] then
                love.graphics.rectangle(
                    'fill',
                    (tetromino.x+x)*gridSize,
                    (tetromino.y+y)*gridSize,
                    gridSize,
                    gridSize
                )
            end
        end
    end
    love.graphics.pop()
end

function love.keypressed(key)
end

function newTetromino()
    local new = {x = 4, y = -3}
    local copyTable = {}
    local tetromino = tetrominoes[math.random(#tetrominoes)]
    for x = 1, 4 do
        copyTable[x] = {}
        for y = 1, 4 do
            print(x, y, tetromino[x][y])
            copyTable[x][y] = tetromino[y][x]
        end
    end
    new.layout = copyTable
    return new
end
