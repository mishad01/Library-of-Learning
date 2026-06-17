export const increaseTotalLikes = () => ({
    type: "INCREASE_TOTAL_LIKES"
})

export const increasreTotalLikesByAmount = (amount) => ({
    type: "INCREASE_TOTAL_LIKES_BY_AMOUNT",
    payload: amount
})

export const decreaseTotalLikes = () => ({
    type: "DECREASE_TOTAL_LIKES"
})