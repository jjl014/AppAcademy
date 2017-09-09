
const Util = {

  addZero(num) {
    if (parseInt(num) < 10) {
      return "0" + num;
    }
    return num;
  }

};



export default Util;
