OneSignal.push(function () {
    OneSignal.getUserId(function (userId) {
        console.log(typeof "OneSignal User ID:", userId);
        var user = JSON.stringify(userId)
        console.log(user)
        document.getElementById('envpush').innerHTML = userId;

        // (Output) OneSignal User ID: 270a35cd-4dda-4b3f-b04e-41d7463a2316    
    });
});