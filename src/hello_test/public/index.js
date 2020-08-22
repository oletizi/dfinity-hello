import describe from 'mocha';
import it from 'mocha';

describe('A nice test.', function() {
    it('does stuff', function () {
        window.alert('Doing stuff!')
    })
})
mocha.run();
window.alert('Hi!');