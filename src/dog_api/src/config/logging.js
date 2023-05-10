const getLogger = () => {
    if (!logger) throw new Error('You must first initialize the logger');
    return logger;
  };