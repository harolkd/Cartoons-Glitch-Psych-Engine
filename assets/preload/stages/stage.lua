function onCreate()

    makeLuaSprite('static', 'rollback', 0, 0);
    setBlendMode('static', 'ADD');
    setProperty('static.alpha', 0.2);
    scaleObject('static', 2.0, 2.0);
    addLuaSprite('static', true);
end
