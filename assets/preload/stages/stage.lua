function onCreate()

    makeAnimatedLuaSprite('rollback', 'rollback', 0, 0);
    addAnimationByPrefix('rollback', 'idle', 'rollback idle', 24, true);
    setBlendMode('rollback', 'ADD');
    setProperty('rollback.alpha', 0.2);
    scaleObject('rollback', 2.0, 2.0);
    addLuaSprite('rollback', true);
end
